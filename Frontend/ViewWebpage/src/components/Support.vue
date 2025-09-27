<template>
  <div class="modal-backdrop">
    <div class="modal-box">
      <button class="custom-close" @click="onClose" aria-label="Bezárás">×</button>
      
      <h4 class="text-center fw-bold mb-3">Támogatás</h4>
      
      <div class="text-center mb-4">
        <h6 class="fw-semibold">{{ product.name }}</h6>
        <p class="text-muted mb-1">{{ product.description }}</p>
        <small class="d-block text-muted">{{ product.collected_amount }} Ft / {{ product.goal_amount }} Ft</small>
        <small class="d-block mt-1" :class="remainingAmount <= 0 ? 'text-danger' : 'text-secondary'">
          {{ remainingAmount <= 0 ? 'A cél már teljesült.' : 'Hiányzik: ' + remainingAmount + ' Ft' }}
        </small>
      </div>

      <form @submit.prevent="submitSupport">
        <div class="mb-3">
          <label for="supportAmount" class="form-label">Támogatás összege (Ft):</label>
          <input
            id="supportAmount"
            v-model.number="supportAmount"
            type="number"
            class="form-control form-control-lg"
            placeholder="Pl. 1000"
            min="1"
            :max="remainingAmount"
            required
          />
        </div>

        <div class="mb-4">
          <label for="message" class="form-label">Üzenet (opcionális):</label>
          <textarea
            id="message"
            v-model="message"
            rows="3"
            class="form-control"
            placeholder="Miért támogatod ezt az ügyet?"
          ></textarea>
        </div>

        <button
          type="submit"
          class="btn btn-primary w-100 btn-lg"
          :disabled="remainingAmount <= 0"
        >
          Támogatom
        </button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Support',
  props: {
    product: Object,
    productId: Number,
    onClose: Function,
    onSupport: Function
  },
  data() {
    return {
      supportAmount: null,
      message: ''
    };
  },
  computed: {
    remainingAmount() {
      return Math.max(0, this.product.goal_amount - this.product.collected_amount);
    }
  },
  methods: {
    submitSupport() {
      const amount = parseInt(this.supportAmount);

      if (isNaN(amount) || amount <= 0) {
        alert('Kérlek adj meg egy érvényes összeget!');
        return;
      }

      if (amount > this.remainingAmount) {
        alert(`Legfeljebb ${this.remainingAmount} Ft-tal támogathatod ezt a célt.`);
        return;
      }

      this.onSupport(this.productId, amount);
      this.onClose();
    }
  }
};
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 127, 127, 0.3);
  backdrop-filter: blur(2px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
}

.modal-box {
  background: #fff;
  border-radius: 20px;
  padding: 2rem;
  width: 100%;
  max-width: 480px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  position: relative;
}

textarea.form-control {
  resize: none;
}

.btn-close {
  background: transparent;
  border: none;
  font-size: 1.2rem;
}
.custom-close {
  position: absolute;
  top: 16px;
  right: 16px;
  background: none;
  border: none;
  font-size: 1.5rem;
  font-weight: bold;
  color: #333;
  cursor: pointer;
  line-height: 1;
}

.custom-close:hover {
  color: #007f7f;
}

</style>
