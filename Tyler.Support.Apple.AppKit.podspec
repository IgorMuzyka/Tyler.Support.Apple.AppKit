
Pod::Spec.new do |s|

	s.name = "TylerSupportAppleAppKit"
	s.version = "0.0.1"
	s.swift_version = "4.2"
	s.summary = "Tyler Support Apple AppKit"
	s.homepage = "https://github.com/IgorMuzyka/Tyler.Support.Apple.AppKit"
	s.source = { :git => "https://github.com/IgorMuzyka/Tyler.Support.Apple.AppKit.git", :tag => s.version.to_s }
	s.license = { :type => "MIT", :file => "LICENSE" }
	s.author = { 'igormuzyka' => "igormuzyka42@gmail.com" }
	s.source_files = "Sources/TylerSupportAppleAppKit/**/*"

	s.dependency "Variable"
	s.dependency "Style"
	s.dependency "Tag"
	s.dependency "Substitutes"
	s.dependency "Tyler"
    s.dependency "TylerSupportAppleCommon"

	s.osx.deployment_target = "10.14"
	s.ios.deployment_target = "10.0"
	s.tvos.deployment_target = "10.0"
	s.watchos.deployment_target = "3.0"

end
