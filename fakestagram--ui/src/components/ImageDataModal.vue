<template>
  <div>
    <div class="modal">
      <div class="modal-card">
        <div class="modal-card__top-bar">
          <span
            @click="closeImageDataModal"
            class="modal-card__close-modal"
          >
            X
          </span>
        </div>
        <img
          class="modal-card__image"
          :src="image"
        />
        <div class="modal-card__data">
          <div class="modal-card__user">
            <span>{{user.name}}</span>
            <span>{{user.gender}}</span>
            <span>{{user.age}}</span>
            <span>{{user.email}}</span>
            <span>{{user.phone}}</span>
            <span>{{user.address}}</span>
          </div>
          <span
            v-for="(tag, index) in tags"
            :key="`${index}-${tag}`"
          >
            {{tag}}
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    image: {
      type: String,
      required: true
    },
    user: {
      type: Object,
      required: true
    },
    tags: {
      type: Array,
      required: true
    }
  },

  methods: {
    closeImageDataModal () {
      this.$emit('closeImageModal')
    }
  }
}
</script>

<style lang="scss">

.modal-card {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #fff;
  width: 950px;
  height: 620px;
  display: grid;
  grid-template-areas:
    'topbar topbar topbar'
    'img img data'
    'img img data';
  grid-gap: 1rem;

  &__top-bar {
    border-bottom: 1px solid #000;
    text-align: right;
    grid-area: topbar;
    height: 80px;
    line-height: 80px;
    font-size: 20px;
    font-weight: bold;
  }

  &__close-modal {
    margin-right: 30px;
    cursor: pointer;
  }

  &__image {
    max-width: 430px;
    max-height: 430px;
    padding-left: 40px;
    grid-area: img;
  }

  &__data {
    padding-right: 40px;
    grid-area: data;
  }

  &__user {
    display: flex;
    flex-direction: column;
  }
}

.modal {
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4);
}
</style>
