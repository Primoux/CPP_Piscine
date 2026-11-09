# C++ Piscine

The ten C++ modules of the 42 Common Core, gathered in one place. Each module is a **git submodule** pointing at its own repository, with a top-level Makefile that builds them all.

Everything is written in **C++98** with `-Wall -Wextra -Werror`, as the subject requires — no C++11 and beyond, which is the whole point: you implement by hand what modern C++ would hand you.

## Clone

The submodules are not fetched by a plain clone:

```bash
git clone --recurse-submodules git@github.com:Primoux/CPP_Piscine.git
```

Already cloned without them:

```bash
git submodule update --init --recursive
```

## Build

```bash
make        # builds every exercise of every module
make clean  # removes object files everywhere
make fclean # removes objects and binaries everywhere
```

The Makefile discovers every nested `Makefile` and recurses into it, so a new exercise is picked up without touching it.

Each exercise can also be built on its own:

```bash
cd CPP_Module_02/ex00 && make && ./a.out
```

## The modules

| Module | Topic | Main classes |
|---|---|---|
| [00](https://github.com/Primoux/CPP_Module_00) | Namespaces, classes, member functions, `static`, `const`, I/O streams | `megaphone`, `PhoneBook`, `Contact` |
| [01](https://github.com/Primoux/CPP_Module_01) | Memory allocation, references, pointers to members | `Zombie`, `Weapon`, `HumanA`, `HumanB`, `Harl` |
| [02](https://github.com/Primoux/CPP_Module_02) | Operator overloading, the orthodox canonical form | `Fixed` — a fixed-point number class |
| [03](https://github.com/Primoux/CPP_Module_03) | Inheritance, including the diamond problem | `ClapTrap`, `ScavTrap`, `FragTrap` |
| [04](https://github.com/Primoux/CPP_Module_04) | Subtype polymorphism, abstract classes, deep copy | `Animal`, `Dog`, `Cat`, `Brain`, `WrongAnimal` |
| [05](https://github.com/Primoux/CPP_Module_05) | Exceptions, and the try/catch discipline | `Bureaucrat`, `AForm` and its three concrete forms, `Intern` |
| [06](https://github.com/Primoux/CPP_Module_06) | The four C++ casts, and serialization | `ScalarConverter`, `Serializer`, `Base`/`A`/`B`/`C` |
| [07](https://github.com/Primoux/CPP_Module_07) | Templates, function and class | `whatever`, `iter`, `Array` |
| [08](https://github.com/Primoux/CPP_Module_08) | Templated containers, iterators, STL algorithms | `easyfind`, `Span`, `MutantStack` |
| [09](https://github.com/Primoux/CPP_Module_09) | STL containers, and choosing the right one | `BitcoinExchange`, `RPN`, `PmergeMe` |

## Two worth a look

**Module 04** is where the orthodox canonical form stops being bureaucracy: `Brain` is allocated on the heap, so a shallow copy makes two animals share one brain, and the destructor frees it twice. `WrongAnimal` exists precisely to show what a missing `virtual` destructor breaks.

**Module 09 ex02**, `PmergeMe`, implements the **Ford-Johnson merge-insertion sort** — the algorithm that minimises comparisons. It is by far the hardest exercise of the ten, and the only one where the subject asks you to beat a theoretical bound rather than just make something work.
