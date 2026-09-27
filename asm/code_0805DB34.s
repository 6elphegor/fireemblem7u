	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805DB34
sub_0805DB34: @ 0x0805DB34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805DB60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DB64 @ =0x08BA31FC
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _0805DB68 @ =0x081E8EEA
	str r0, [r1, #0x48]
	cmp r5, #0
	bne _0805DB70
	ldr r0, _0805DB6C @ =0x0826A7E8
	b _0805DB72
	.align 2, 0
_0805DB60: .4byte 0x0201774C
_0805DB64: .4byte 0x08BA31FC
_0805DB68: .4byte 0x081E8EEA
_0805DB6C: .4byte 0x0826A7E8
_0805DB70:
	ldr r0, _0805DB7C @ =0x0826D7D4
_0805DB72:
	str r0, [r1, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB7C: .4byte 0x0826D7D4
