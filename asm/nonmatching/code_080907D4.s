	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080907D4
sub_080907D4: @ 0x080907D4
	ldr r0, _080907EC @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0xa0
	bne _080907F4
	movs r3, #0
	ldr r0, _080907F0 @ =0x02012968
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	b _080907FC
	.align 2, 0
_080907EC: .4byte 0x04000006
_080907F0: .4byte 0x02012968
_080907F4:
	ldr r0, _08090810 @ =0x02012968
	cmp r3, #0xa0
	bls _080907FC
	movs r3, #0
_080907FC:
	ldr r2, _08090814 @ =0x04000042
	ldr r0, [r0]
	lsls r1, r3, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	lsls r0, r3, #8
	ldrb r1, [r1, #1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08090810: .4byte 0x02012968
_08090814: .4byte 0x04000042
