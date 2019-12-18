from setuptools import setup, find_packages

setup(
    name='pycounter',
    version='1.0.0',
    packages=find_packages(),
    install_requires=['Flask>=1.1.1', 'redis>=3.3.11'],
    author='Dixon Whitmire',
    description='Sample Application Used to Demonstrate Docker Container Linking',
    keywords='python redis docker sample tutorial',
    url='https://github.com/dixonwhitmire/pycounter',
    project_urls={
        'Bug Tracker': 'https://github.com/dixonwhitmire/pycounter/issues',
        'Documentation': 'https://github.com/dixonwhitmire/pycounter/blob/master/README.md',
        'Source Code': 'https://github.com/dixonwhitmire/pycounter',
    },
    classifiers=[
        'License :: MIT'
    ]
)