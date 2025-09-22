/// A module that can be configurated with an existing instance.
@MainActor
public protocol ConfiguratorModule: AnyObject {
  associatedtype Dependency = Void
  associatedtype Payload = Void

  /// A configurator for `Self`.
  associatedtype Configurator = Shared_Foundation.Configurator<Self>

  /// Configures an existing module with a dependency and a payload.
  func configure(dependency: Dependency, payload: Payload)
}

public extension ConfiguratorModule where Dependency == Void {
  /// Configures an existing module with a payload.
  func configure(payload: Payload) {
    self.configure(dependency: Void(), payload: payload)
  }
}

public extension ConfiguratorModule where Payload == Void {
  /// Configures an existing module with a dependency.
  func configure(dependency: Dependency) {
    self.configure(dependency: dependency, payload: Void())
  }
}

public extension ConfiguratorModule where Dependency == Void, Payload == Void {
  /// Configures an existing module.
  func configure() {
    self.configure(dependency: Void(), payload: Void())
  }
}
