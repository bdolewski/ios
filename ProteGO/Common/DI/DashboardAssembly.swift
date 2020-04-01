import Swinject

final class DashboardAssembly: Assembly {

    func assemble(container: Container) {
        registerDashboardViewController(container)
        registerDashboardViewModel(container)
        registerDashboardModel(container)
    }

    private func registerDashboardViewController(_ container: Container) {
        container.register(DashboardViewController.self) { resolver in
            return DashboardViewController(viewModel: resolver.resolve(DashboardViewModelType.self))
        }
    }

    private func registerDashboardViewModel(_ container: Container) {
        container.register(DashboardViewModelType.self) { resolver in
            return DashboardViewModel(model: resolver.resolve(DashboardModelType.self))
        }
    }

    private func registerDashboardModel(_ container: Container) {
        container.register(DashboardModelType.self) { resolver in
            return DashboardModel(dangerStatusManager: resolver.resolve(DangerStatusManagerType.self))
        }
    }
}