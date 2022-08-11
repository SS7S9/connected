import 'package:flutter/material.dart';

import 'constants.dart';

class AppUtils {
  smallTextStyle({color}) {
    return TextStyle(
      color: color,
      fontSize: 11,
      fontWeight: FontWeight.normal,
    );
  }

  mediumTextStyle({color}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  bookingDetailsWidget({context, number, clientName, time, status, boxColor}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            number,
            style: smallTextStyle(),
          ),
          Text(
            clientName,
            style: smallTextStyle(),
          ),
          Text(
            time,
            style: smallTextStyle(),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(color: boxColor),
              child: Text(
                status,
                style: const TextStyle(fontSize: 10),
              )),
          Row(
            children: [
              Text(
                "Edit",
                style: smallTextStyle(color: greenColor),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 25,
                width: 1.3,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.delete,
                color: Colors.grey,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }

  clientListWidget({context, image, text, onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: image,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style: mediumTextStyle(
                  color: brownColor,
                ),
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.delete,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 1.5,
            height: 30,
            color: Colors.grey[400],
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Edit",
            style: mediumTextStyle(
              color: greenColor,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 1.5,
            height: 30,
            color: Colors.grey[400],
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: seaGreenColor,
                borderRadius: BorderRadius.circular(
                  7,
                ),
              ),
              child: Center(
                  child: Text(
                "Send Email",
                style: mediumTextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }

  emailListWidget({context, name, email, time}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
              child: Text(
                name,
                style: mediumTextStyle(
                  color: brownColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  email,
                  style: mediumTextStyle(
                    color: maroonColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Center(
              child: Text(
                time,
                style: mediumTextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
