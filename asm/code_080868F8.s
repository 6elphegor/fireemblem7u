	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080868F8
sub_080868F8: @ 0x080868F8
	push {r4, r5, lr}
	bl GetGameTime
	lsrs r1, r0, #1
	movs r2, #0x1f
	ands r1, r2
	ldr r0, _08086958 @ =0x08403974
	adds r0, #0x5e
	ldrh r4, [r0]
	ldr r5, _0808695C @ =0x02022B56
	cmp r1, #0x10
	ble _08086918
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x10
	subs r1, r1, r0
_08086918:
	movs r3, #0x1f
	adds r0, r4, #0
	ands r0, r2
	movs r2, #0x10
	subs r2, r2, r1
	adds r1, r0, #0
	muls r1, r2, r1
	asrs r1, r1, #4
	ands r1, r3
	movs r3, #0xf8
	lsls r3, r3, #2
	adds r0, r4, #0
	ands r0, r3
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	movs r3, #0xf8
	lsls r3, r3, #7
	ands r4, r3
	adds r0, r4, #0
	muls r0, r2, r0
	asrs r0, r0, #4
	ands r0, r3
	adds r1, r1, r0
	strh r1, [r5]
	strh r1, [r5, #0x20]
	bl EnablePalSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086958: .4byte 0x08403974
_0808695C: .4byte 0x02022B56
