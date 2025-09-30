import sys
import sysconfig
import setuptools
from pybind11.setup_helpers import Pybind11Extension, build_ext

ext_modules = [
    Pybind11Extension(
        "geometric_plan_c",                # Python module name
        ["geometric_plan.cpp"],            # C++ source
        include_dirs=[
            "/usr/include/eigen3",         # Eigen
            "/usr/local/include/ompl-1.6"  # OMPL
        ],
        language="c++",
        extra_compile_args=["-std=c++17"],  # ensure modern C++
    ),
]

setuptools.setup(
    name="geometric_plan_c",
    version="0.1",
    author="Douglas Tesch",
    description="Return all solutions of a geometric problem",
    ext_modules=ext_modules,
    cmdclass={"build_ext": build_ext},
    zip_safe=False,
    install_requires=["pybind11>=2.7"],
)
