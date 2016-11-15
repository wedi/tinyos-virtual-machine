# -*- mode: ruby -*-
# vi: set ft=ruby :

# See: https://github.com/mitchellh/vagrant/issues/5774
def usbfilter_exists(vendor_id, product_id)
    # Determine if a usbfilter with the provided Vendor/Product ID combination
    # already exists on this VM.
    # NOTE: The "machinereadable" output for usbfilters is more
    #       complicated to work with (due to variable names including
    #       the numeric filter index) so we don't use it here.
    #
    machine_id_filepath = File.join(".vagrant", "machines", $boxname.downcase, "virtualbox", "id")

    if not File.exists? machine_id_filepath
      # VM hasn't been created yet.
      return false
    end

    machine_id = File.read(machine_id_filepath)

    vm_info = `VBoxManage showvminfo #{machine_id}`
    filter_match = "VendorId:         #{vendor_id}\nProductId:        #{product_id}\n"

    return vm_info.include? filter_match
end

def better_usbfilter_add(vb, vendor_id, product_id, filter_name)
    # This is a workaround for the fact VirtualBox doesn't provide
    # a way for preventing duplicate USB filters from being added.
    #
    # TODO: Implement this in a way that it doesn't get run multiple
    #       times on each Vagrantfile parsing.
    if not usbfilter_exists(vendor_id, product_id)
      vb.customize ["usbfilter", "add", "0",
                    "--target", :id,
                    "--name", filter_name,
                    "--vendorid", vendor_id,
                    "--productid", product_id
                    ]
    end
end
