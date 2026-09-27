	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045124
sub_08045124: @ 0x08045124
	push {r4, r5, lr}
	ldr r0, _08045164 @ =0x03001400
	ldr r1, _08045168 @ =0x0203DC9C
	ldrb r1, [r1, #4]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	bl StartMu
	ldr r5, _0804516C @ =0x03001420
	str r0, [r5]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	subs r2, #1
	lsls r2, r2, #4
	bl SetMuScreenPosition
	ldr r0, [r5]
	bl DisableMuCamera
	ldr r0, [r5]
	movs r1, #3
	bl SetMuFacing
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045164: .4byte 0x03001400
_08045168: .4byte 0x0203DC9C
_0804516C: .4byte 0x03001420
