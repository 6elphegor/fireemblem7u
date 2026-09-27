	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08015E64
sub_08015E64: @ 0x08015E64
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _08015E94 @ =0x08B92E60
	movs r1, #3
	bl Proc_Start
	ldr r2, _08015E98 @ =0x0202BBB8
	ldrh r3, [r2, #0x14]
	lsls r1, r3, #4
	strh r1, [r0, #0x2c]
	ldrh r2, [r2, #0x16]
	lsls r1, r2, #4
	strh r1, [r0, #0x2e]
	lsls r4, r4, #4
	strh r4, [r0, #0x30]
	lsls r5, r5, #4
	strh r5, [r0, #0x32]
	str r6, [r0, #0x38]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015E94: .4byte 0x08B92E60
_08015E98: .4byte 0x0202BBB8
