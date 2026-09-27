	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_Promo_WindowScroll0
EkrLvup_Promo_WindowScroll0: @ 0x0806959C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080695B0
	adds r0, r5, #0
	bl Proc_Break
	b _080695E8
_080695B0:
	ldr r0, _080695F0 @ =EfxPartsofScroll2HBlank
	bl SetOnHBlankA
	ldr r4, _080695F4 @ =0x020200D0
	ldr r0, [r4]
	bl Proc_End
	bl NewEfxPartsofScroll2
	str r0, [r4]
	ldr r4, _080695F8 @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #8
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_080695E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080695F0: .4byte EfxPartsofScroll2HBlank
_080695F4: .4byte 0x020200D0
_080695F8: .4byte 0x000002CD
