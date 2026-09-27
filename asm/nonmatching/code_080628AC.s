	.include "macro.inc"

	.syntax unified

	thumb_func_start efxYushaSpinShieldOBJ_806CD14
efxYushaSpinShieldOBJ_806CD14: @ 0x080628AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x60]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x45
	bne _0806290A
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _080628E4
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080628DC
	ldr r0, _080628D8 @ =0x08BAEC94
	b _080628FA
	.align 2, 0
_080628D8: .4byte 0x08BAEC94
_080628DC:
	ldr r0, _080628E0 @ =0x08BAD9F4
	b _080628FA
	.align 2, 0
_080628E0: .4byte 0x08BAD9F4
_080628E4:
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080628F8
	ldr r0, _080628F4 @ =0x08BB1234
	b _080628FA
	.align 2, 0
_080628F4: .4byte 0x08BB1234
_080628F8:
	ldr r0, _08062910 @ =0x08BAFF64
_080628FA:
	str r0, [r4, #0x24]
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #6]
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806290A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062910: .4byte 0x08BAFF64
