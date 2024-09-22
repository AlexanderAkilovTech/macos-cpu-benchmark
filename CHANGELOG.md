# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 09-22-2024

### Added
- Initial release of the macOS CPU Benchmark script.
- CPU temperature monitoring at idle and under load.
- Fan speed monitoring at idle and under load (if applicable).
- Stress test functionality to measure CPU performance.
- Summary output of idle and load CPU temperatures, fan speeds, and test duration.

### Fixed
- None (initial release).

---

## Future Releases

### Planned Features
- **GPU Temperature Monitoring**: Add support for monitoring GPU temperatures on Intel-based Macs.
- **Advanced Fan Control**: Integration with `smcFanControl` for more advanced fan monitoring and control.
- **Battery Monitoring**: Support for monitoring battery health, temperature, and cycle count for MacBooks.
- **Tj-Max Alerts**: Introduce warnings when CPU temperature approaches and exceeds the Tj-Max limit to prevent thermal throttling.
