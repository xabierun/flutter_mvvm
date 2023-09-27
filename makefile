.PHONY: clean
clean:
	flutter clean
	flutter pub cache repair
	(cd ios && rm -rf Podfile.lock && rm -rf Pods)

.PHONY: setup
setup:
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	flutter pub run build_runner watch
