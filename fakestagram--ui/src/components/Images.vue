<template>
  <div class="images">
    <img
      v-for="image in images"
      :key="image._id"
      :src="image.picture"
      class="images__picture"
      @click="showImageDataModal(image)"
    />
    <image-data-modal
      v-if="showImageModal"
      :image="picture"
      :user="user"
      :tags="tags"
      @closeImageModal="closeImageDataModal"
    />
  </div>
</template>

<script>
import ImageDataModal from './ImageDataModal'
import axios from 'axios'

export default {
  name: 'Images',
  components: {
    ImageDataModal
  },
  data () {
    return {
      showImageModal: false,
      picture: '',
      user: {},
      tags: [],
      images: null
    }
  },
  mounted () {
    const axios = require('axios')
    axios.get(`http://localhost:3000/images`)
    .then(response => {
      this.images = response.data
    })
  },
  methods: {
    showImageDataModal (image) {
      axios.get(`http://localhost:3000/images/${image.id}`)
    .then(response => {
      this.user = response.data.user
      this.picture = response.data.image.picture
      this.tags = response.data.tags
    })
      this.showImageModal = true
    },

    closeImageDataModal () {
      this.showImageModal = false
    }
  }
}
</script>

<style lang="scss">
.images {
  display: flex;
  flex-wrap: wrap;


  &__picture {
    height: 185px;
    width: 185px;
    margin: .25rem;
  }
}
</style>
