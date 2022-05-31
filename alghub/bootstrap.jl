(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using Alghub
push!(Base.modules_warned_for, Base.PkgId(Alghub))
Alghub.main()
