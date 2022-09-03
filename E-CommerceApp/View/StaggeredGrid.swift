//
//  StaggeredGrid.swift
//  StaggeredGrid
//
//  Created by Admin on 2.09.22.
//

import SwiftUI

struct StaggeredGrid<Content: View, T: Identifiable>: View where T: Hashable{

    var content: (T) -> Content
    var list: [T]
    var columns: Int

    var showIndicators: Bool
    var spacing: CGFloat

    init(showIndicators: Bool = false,
         columns: Int,
         spacing: CGFloat = 10,
         list: [T],
         @ViewBuilder content: @escaping (T) -> Content ) {

        self.content = content
        self.list = list
        self.spacing = spacing
        self.showIndicators = showIndicators
        self.columns = columns
    }

    func setUpList() -> [[T]] {
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        var currentIndex: Int = 0

        for object in list {
            gridArray[currentIndex].append(object)

            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        return gridArray
    }

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            ForEach(setUpList(), id: \.self) { columnsData in
                LazyVStack(spacing: 15) {
                    ForEach(columnsData) { object in
                        content(object)
                    }
                }
                .padding(.top, getIndex(values: columnsData) == 1 ? 80 : 0)
            }
        }
        .padding(.vertical)
    }

    func getIndex(values: [T]) -> Int {
        let index = setUpList().firstIndex { t in
            return t == values
        } ?? 0
        return index
    }
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
