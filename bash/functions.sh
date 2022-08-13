# Print version of given Python package
pyver(){
    pypkg=$1
    python -c "import ${pypkg}; print(${pypkg}.__version__)"
}