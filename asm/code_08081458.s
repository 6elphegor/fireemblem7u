	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncStatScreenBgOffset
SyncStatScreenBgOffset: @ 0x08081458
	push {r4, lr}
	ldr r0, _0808148C @ =0x0200310C
	movs r1, #6
	ldrsh r4, [r0, r1]
	rsbs r4, r4, #0
	movs r0, #0xff
	ands r4, r0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808148C: .4byte 0x0200310C
