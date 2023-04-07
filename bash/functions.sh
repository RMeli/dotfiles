# Print version of given Python package
pyver(){
    pypkg=$1
    python -c "import ${pypkg}; print(${pypkg}.__version__)"
}

# Recoursively touch all files
rtouch(){
    path=$1
    find ${path} --print --type f,d --exec touch {} +
}
