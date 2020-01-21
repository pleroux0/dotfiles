" Clean project, cmake, and conan vars
function! s:clear_vars()
  ProjectClearVars
  CMakeClearVars
  ConanClearVars
endfunction

" Toolkits
function! s:toolkit_gcc_debug()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = getcwd() . '/build/linux/gcc/debug'
  let t:cmake_cxx_compiler = 'g++'
  let t:cmake_c_compiler = 'gcc'
  let t:cmake_build_type = 'Debug'
  let t:cmake_export_compile_commands = v:true
  let t:conan_profile = 'gcc_debug'

  CMakeSetMake
endfunction

function! s:toolkit_gcc_release()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = getcwd() . '/build/linux/gcc/release'
  let t:cmake_cxx_compiler = 'g++'
  let t:cmake_c_compiler = 'gcc'
  let t:cmake_build_type = 'Release'
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_gcc_production()
  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/gcc/production'
  let t:cmake_cxx_compiler = 'g++'
  let t:cmake_c_compiler = 'gcc'
  let t:cmake_build_type = 'Release'
  let t:cmake_cxx_flags = ['-flto', '--param vect-max-peeling-for-alignment=0']
  let t:cmake_c_flags = ['-flto', '--param vect-max-peeling-for-alignment=0']
  let t:cmake_user_arguments = [
    \ '-DBUILD_SHARED_LIBS=OFF',
    \ '-DCMAKE_EXE_LINKER_FLAGS="-flto"',
    \]
  let t:cmake_export_compile_commands = v:true
  let t:conan_profile = 'gcc_production'

  CMakeSetMake
endfunction

function! s:toolkit_install()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/gcc/install'
  let t:cmake_cxx_compiler = 'g++'
  let t:cmake_c_compiler = 'gcc'
  let t:cmake_build_type = 'Release'
  let t:cmake_cxx_flags = ['-flto', '-march=native', '--param vect-max-peeling-for-alignment=0']
  let t:cmake_c_flags = ['-flto', '-march=native', '--param vect-max-peeling-for-alignment=0']
  let t:cmake_user_arguments = [
    \ '-DCMAKE_INSTALL_PREFIX:PATH=/home/pleroux/.local/',
    \ '-DBUILD_SHARED_LIBS=ON',
    \ '-DCMAKE_EXE_LINKER_FLAGS="-flto"',
    \]
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_clang_debug()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/clang/debug'
  let t:cmake_cxx_compiler = 'clang++'
  let t:cmake_c_compiler = 'clang'
  let t:cmake_build_type = 'Debug'
  "let t:cmake_cxx_flags = '-stdlib=libc++'
  let t:conan_profile = 'clang_debug'
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_clang_sanitize_undefined()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/clang/sanitize/undefined'
  let t:cmake_cxx_compiler = 'clang++'
  let t:cmake_c_compiler = 'clang'
  let t:cmake_build_type = 'Debug'
  let t:cmake_cxx_flags = '-fsanitize=undefined'
  let t:conan_profile = 'clang_sanitize_undefined'
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_clang_sanitize_address()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/clang/sanitize/address'
  let t:cmake_cxx_compiler = 'clang++'
  let t:cmake_c_compiler = 'clang'
  let t:cmake_build_type = 'Debug'
  let t:cmake_cxx_flags = '-fsanitize=address'
  let t:conan_profile = 'clang_sanitize_address'
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_clang_sanitize_memory()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/clang/sanitize/memory'
  let t:cmake_cxx_compiler = 'clang++'
  let t:cmake_c_compiler = 'clang'
  let t:cmake_build_type = 'Debug'
  let t:cmake_cxx_flags = '-fsanitize=memory'
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_clang_release()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/clang/release'
  let t:cmake_cxx_compiler = 'clang++'
  let t:cmake_c_compiler = 'clang'
  let t:cmake_build_type = 'Release'
  let t:conan_profile = 'clang_release'
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_clang_relwithdebinfo()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/clang/relwithdebinfo'
  let t:cmake_cxx_compiler = 'clang++'
  let t:cmake_c_compiler = 'clang'
  let t:cmake_build_type = 'RelWithDebInfo'
  let t:conan_profile = 'clang_relwithdebinfo'
  " let t:cmake_user_arguments = '-DCMAKE_TOOLCHAIN_FILE=conan_paths.cmake'
  let t:cmake_export_compile_commands = v:true

  CMakeSetMake
endfunction

function! s:toolkit_mingw_release()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/mingw/release'
  let t:cmake_cxx_compiler = 'i686-w64-mingw32-g++'
  let t:cmake_c_compiler = 'i686-w64-mingw32-gcc'
  let t:cmake_build_type = 'Release'
  let t:cmake_user_arguments = '-DCMAKE_TOOLCHAIN_FILE=/home/pleroux/Code/Toolchains/i686-mingw32-w64.cmake'
  let t:cmake_export_compile_commands = v:true
  let t:conan_profile = 'i686-mingw32-w64'
  let t:conan_build = 'missing'

  CMakeSetMake
endfunction

function! s:toolkit_mingw_debug()
  call s:clear_vars()

  let t:project_source_dir = myutil#abs_path(getcwd())
  let t:project_build_dir = 'build/linux/mingw/debug'
  let t:cmake_cxx_compiler = 'i686-w64-mingw32-g++'
  let t:cmake_c_compiler = 'i686-w64-mingw32-gcc'
  let t:cmake_build_type = 'Debug'
  let t:cmake_user_arguments = '-DCMAKE_TOOLCHAIN_FILE=/home/pleroux/Code/Toolchains/i686-mingw32-w64.cmake'
  let t:cmake_export_compile_commands = v:true
  let t:conan_profile = 'i686-mingw32-w64'
  let t:conan_build = 'missing'

  CMakeSetMake
endfunction

function! s:my_cmake_setup()
  "if myconan#is_conan_project() || myconan#is_conan_workspace()
  "  if !myconan#install()
  "    return v:false
  "  endif
  "endif

  if !mycmake#configure()
    return v:false
  endif

  if !myproject#update_compile_commands()
    return v:false
  endif

  CocRestart

  return v:true
endfunction

function! s:my_ctest()
  return myutil#run_command_in(['ctest','--output-on-failure'], t:project_build_dir)
endfunction

command! ToolkitGCCDebug call s:toolkit_gcc_debug()
command! ToolkitGCCRelease call s:toolkit_gcc_release()
command! ToolkitGCCProduction call s:toolkit_gcc_production()
command! ToolkitClangDebug call s:toolkit_clang_debug()
command! ToolkitClangRelease call s:toolkit_clang_release()
command! ToolkitClangSanitizeUndefined call s:toolkit_clang_sanitize_undefined()
command! ToolkitClangSanitizeAddress call s:toolkit_clang_sanitize_address()
command! ToolkitClangSanitizeMemory call s:toolkit_clang_sanitize_memory()
command! ToolkitInstall call s:toolkit_install()
command! ToolkitClangRelWithDebInfo call s:toolkit_clang_relwithdebinfo()
command! ToolkitMingwDebug call s:toolkit_mingw_debug()
command! ToolkitMingwRelease call s:toolkit_mingw_release()
command! MyCMakeSetup call s:my_cmake_setup()
command! MyCTest call s:my_ctest()
