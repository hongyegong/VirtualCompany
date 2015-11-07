class Ec2InstancesController < ApplicationController
  before_action :set_ec2_instance, only: [:show, :edit, :update, :destroy]

  # GET /ec2_instances
  # GET /ec2_instances.json
  def index

    credentials = Aws::Credentials.new('AKIAJ2JD2EKKFVDSR37A', 'cnZUnzuyYPqUevEPb045VJUnW55VR+rUCQrplzd/')
    ec2 = Aws::EC2::Client.new(
      region: "us-east-1",
      credentials: credentials
    )
    #i = ec2.instances.create(:image_id => "ami-e3106686")
    resp = ec2.run_instances({
      dry_run: true,
      image_id: "ami-e3106686", # required
      min_count: 1, # required
      max_count: 1, # required
      instance_type: "t1.micro", # accepts t1.micro, m1.small, m1.medium, m1.large, m1.xlarge, m3.medium, m3.large, m3.xlarge, m3.2xlarge, m4.large, m4.xlarge, m4.2xlarge, m4.4xlarge, m4.10xlarge, t2.micro, t2.small, t2.medium, t2.large, m2.xlarge, m2.2xlarge, m2.4xlarge, cr1.8xlarge, i2.xlarge, i2.2xlarge, i2.4xlarge, i2.8xlarge, hi1.4xlarge, hs1.8xlarge, c1.medium, c1.xlarge, c3.large, c3.xlarge, c3.2xlarge, c3.4xlarge, c3.8xlarge, c4.large, c4.xlarge, c4.2xlarge, c4.4xlarge, c4.8xlarge, cc1.4xlarge, cc2.8xlarge, g2.2xlarge, cg1.4xlarge, r3.large, r3.xlarge, r3.2xlarge, r3.4xlarge, r3.8xlarge, d2.xlarge, d2.2xlarge, d2.4xlarge, d2.8xlarge
      placement: {
        tenancy: "default", # accepts default, dedicated
      },

      block_device_mappings: [
        {
          virtual_name: "String",
          device_name: "String",
          ebs: {
            snapshot_id: "String",
            volume_size: 1,
            delete_on_termination: true,
            volume_type: "standard", # accepts standard, io1, gp2
            iops: 1,
            encrypted: true,
          },

        },
      ],
      monitoring: {
        enabled: true, # required
      },
      disable_api_termination: true,
      instance_initiated_shutdown_behavior: "stop", # accepts stop, terminate
      network_interfaces: [
        {
          delete_on_termination: true,
          private_ip_addresses: [
            {
              private_ip_address: "172.31.2.177", # required
              primary: true,
            },
          ],
          secondary_private_ip_address_count: 1,
          associate_public_ip_address: true,
        },
      ],
      ebs_optimized: true,
    })
    @ec2_instances = Ec2Instance.all
  end

  # GET /ec2_instances/1
  # GET /ec2_instances/1.json
  def show
  end

  # GET /ec2_instances/new
  def new
    @ec2_instance = Ec2Instance.new
  end

  # GET /ec2_instances/1/edit
  def edit
  end

  # POST /ec2_instances
  # POST /ec2_instances.json
  def create
    @ec2_instance = Ec2Instance.new(ec2_instance_params)

    respond_to do |format|
      if @ec2_instance.save
        format.html { redirect_to @ec2_instance, notice: 'Ec2 instance was successfully created.' }
        format.json { render :show, status: :created, location: @ec2_instance }
      else
        format.html { render :new }
        format.json { render json: @ec2_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ec2_instances/1
  # PATCH/PUT /ec2_instances/1.json
  def update
    respond_to do |format|
      if @ec2_instance.update(ec2_instance_params)
        format.html { redirect_to @ec2_instance, notice: 'Ec2 instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @ec2_instance }
      else
        format.html { render :edit }
        format.json { render json: @ec2_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ec2_instances/1
  # DELETE /ec2_instances/1.json
  def destroy
    @ec2_instance.destroy
    respond_to do |format|
      format.html { redirect_to ec2_instances_url, notice: 'Ec2 instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ec2_instance
      @ec2_instance = Ec2Instance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ec2_instance_params
      params[:ec2_instance]
    end
end
