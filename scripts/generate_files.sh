PROJECT_ROOT="$(dirname $0)"/..

# Change dir to project root
cd $PROJECT_ROOT

## Generate files
dart run build_runner build --delete-conflicting-outputs