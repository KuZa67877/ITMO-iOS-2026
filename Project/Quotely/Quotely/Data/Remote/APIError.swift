//
//  APIError.swift
//  Quotely
//
//  Created by Egor Kuzminykh on 15.10.2026.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case network(URLError.Code)
    case http(status: Int, message: String?)
    case encoding
    case decoding

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Не удалось сформировать адрес запроса."
        case .invalidResponse:
            return "Сервер вернул некорректный ответ."
        case .network(.notConnectedToInternet):
            return "Нет подключения к интернету. Проверьте соединение и повторите попытку."
        case .network(.timedOut):
            return "Сервер не ответил вовремя. Повторите попытку."
        case .network:
            return "Не удалось связаться с сервером. Повторите попытку."
        case let .http(status, message):
            let details = message.map { " \($0)" } ?? " Повторите попытку позже."
            return "Ошибка сервера (HTTP \(status)).\(details)"
        case .encoding:
            return "Не удалось подготовить данные для отправки."
        case .decoding:
            return "Не удалось прочитать данные сервера: неожиданный формат ответа."
        }
    }
}
