//
//  CardDish.swift
//  DishApp
//
//  Created by Никита Ясеник on 15.07.2023.
//

import SwiftUI

struct CardDish: View {
    
    var imageURL: String
    var name: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: 109, alignment: .center)
            .background(Color.primary.opacity(0.05))
//            .frame(minHeight: 109)
            .mask(RoundedRectangle(cornerRadius: 20)
                .frame(maxWidth: .infinity))
            Text(name)
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .regular))
                .padding(.leading, 3)
                .multilineTextAlignment(.leading)
        }
        .frame(idealHeight: 145)
    }
}

struct CardDish_Previews: PreviewProvider {
    static var previews: some View {
        CardDish(imageURL: "https://lh3.googleusercontent.com/fife/APg5EOaSblNRXMPgDlLF2qWvWp0VsGv1OIVNgaGi44naVRSSGRXwj4PMzdHOXgxfAl_2oi_SZI7FNxIZMP8WbCCR85SwkX0bwsx10EeFy9eJ6jX58h-d7Lkuozafqad72jXrGFYXSgeIGoELeaRFj3ruE44NikGegMxOlrLBoNwRwi2UeV1uyAyQ_6DhWN0IdRWlgTRzYmXy8n1hKYUimjMy5IN5eKA73dcCpKBikxJzePGE8td20IH0DRuqccn8h_kc5FzNrF6Cyb_biFtfnWnxpHk9OAGvVflAD4AETlP2BwhMmM7E0pygrDa26cOE3PVCGbk28aqrb0eO3tBCXWqvDTjAR-MtQLe0OGRf_Cnhn5whhvY3q3VH6SPF36pDg8Tf6VyyiHVwQlQ-HGbGKg9LnD4M9isoK7bNiRy9zpCF-OJQNmVF_S1JupK6nN_Xerhl53E-zlnhdsBdy9A-BL_KWtsWvj5TVU85JMc1a2cc-RAG85cBg8jWYC59M0ekBIG6cmNsFOygdd-S286hxjO8ARdi8Uz0U7R84-k65i7CLFtJGqWppR8qyN0RArXHMl1-Eh0cMxfYLL1Od62xD2U1WGqNKlBQ7Iv0MzFo1AiGFZKk9__huj08_nNQQ7yzwLLTNHSGZBWturGu2waY-t3xYWJfLchVaM6j3YH2saf6n612aQbQUtpQrY5UJ0Cs_t--vOqhdpX2j_nD3AKJWwrG9vaQzRAbq7RXGTVTWH_Q42aY4kcpKox9xh0jbeq2jOYbKbetnO56lfDwR7QTsSt5bTcXYxtkxbdRNTz_cR9oGK3CNeLQJlL4vN4yCBB8uhg502BsX9JlvjEWbYEpfd3z0BS428f_rH4TgiDkH1LpEBUr_pT7IBcdUsEkB9ZmeEx1dZ4OTtzuHmVALF_WMHwWylEQO4DgtkYIKGo6Z2gZGDStDneuuJgk_BacgoIhkGCIqHPq2kqDR7yO5MHxTWf2Vmg2eRKm9Ebl8JwOOGCtX7t5H5Ce9Iw0_apio9moSPe_BR8bcgRGH8IvXroOo3rJudmroTX-TY_Lb7lzZ5YTir-9yVOis31kPGPm_9xuRVqcwVGoLo3K_NSHFz_quUEur6g8IMfuVYsYry-arZVxgf15sKLzytjdpU6edeCReJ1vpvYAb2nEOUc_gunhGw2SFmHKZ1QmpW1Vsvvh2RyDA0l8vXADkL5Jh5xP6CTGdMpn6txRiEpPnP2X9xwgVzIZf0NOizrn4_la39bB6nSCYW3m3-n44KlZcVM6o5zC1YYTK621XFwbmeavAx6dwkCkis_uub5deIsFCZMEq48LFwMJHoYfRhs4ybdoLwrKUps6mhW65KLN9krJjOUQ5T1AdCVRQhOABTz2QozeytI81MwHQKX2ONdPFquIu8YpyL0oqjPmfRMxNn2lcv1WYahTbmX5lAAcS1Qp1RQBV-6M-BrZ3CK9ujc7bbY_XmIRLA8QUq3m1QS0hOHz1bdBqgmPeCY-onmxkI_yOfAUyTy6fm_6uvdowgB_Gds4AQ6I_ACj7JEw6bjTGkDUBf9X3auUOpDDxGOileFDsXvkw4JHGeizI2zU5iMOgc9AFqqRSVY0UliCiqbCCUl0VVIeO9qjwrw5hXh8Lvv-iaVDGRS-4BmSfLzhtIlJ=w1366-h617", name: "Рыба с овощами и рисом")
    }
}
