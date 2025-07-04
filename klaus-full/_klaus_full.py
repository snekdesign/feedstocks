import collections
import contextlib
import itertools
import os
import subprocess

import klaus.contrib.app_args

os.environ.setdefault('KLAUS_SITE_NAME', 'Git')
args, kwargs = klaus.contrib.app_args.get_args_from_env()
if not args[0]:
    repos = subprocess.run(
        'ein tool find',
        check=True,
        encoding='locale',
        stdout=subprocess.PIPE,
    ).stdout.lower().splitlines()
    if not repos:
        raise RuntimeError('Not a Git repository')
    repos.sort(key=os.path.basename)
    repo_paths = collections.defaultdict(list)
    for _, g in itertools.groupby(repos, os.path.basename):
        for i, repo in enumerate(sorted(g)):
            repo_paths[i or None].append(repo)
    args = (repo_paths, args[1])

with contextlib.ExitStack() as stack:
    if htdigest_file := kwargs['htdigest_file']:
        kwargs['htdigest_file'] = stack.enter_context(
            open(htdigest_file, encoding='utf-8'),
        )
    app = klaus.make_app(*args, **kwargs)
