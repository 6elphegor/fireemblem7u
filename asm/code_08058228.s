	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058228
sub_08058228: @ 0x08058228
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08058254 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08058258 @ =0x08BA1A1C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805825C @ =0x081E8258
	str r1, [r0, #0x48]
	ldr r1, _08058260 @ =0x081FBD70
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058254: .4byte 0x0201774C
_08058258: .4byte 0x08BA1A1C
_0805825C: .4byte 0x081E8258
_08058260: .4byte 0x081FBD70
