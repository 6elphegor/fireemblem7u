	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806A000
sub_0806A000: @ 0x0806A000
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0806A02A
	ldr r0, [r4, #0x4c]
	ldr r1, _0806A058 @ =0x02022862
	movs r2, #8
	str r2, [sp]
	adds r2, r3, #0
	movs r3, #0xf
	bl sub_0805067C
_0806A02A:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	ldrh r3, [r4, #0x30]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0806A050
	strh r2, [r4, #0x2c]
	strh r2, [r4, #0x2e]
	str r2, [r4, #0x44]
	ldr r0, _0806A05C @ =0x082E5C8A
	str r0, [r4, #0x48]
	ldr r0, _0806A060 @ =0x081E565C
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	bl Proc_Break
_0806A050:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A058: .4byte 0x02022862
_0806A05C: .4byte 0x082E5C8A
_0806A060: .4byte 0x081E565C
