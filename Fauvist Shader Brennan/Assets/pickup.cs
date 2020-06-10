using System.Collections;
using System.Collections.Generic;
using UnityEngine;



public class pickup : MonoBehaviour
{
    public Transform onHand;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnMouseDown()
    {
        GetComponent<Rigidbody>().useGravity = false;
        this.transform.position = onHand.transform.position;
        this.transform.parent = GameObject.Find("FirstPerson-AIO").transform;
    }

    void OnMouseUp()
    {
        this.transform.parent = null;
        GetComponent<Rigidbody>().useGravity = true;
    }
}
