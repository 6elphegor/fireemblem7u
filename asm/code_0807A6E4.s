	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTutorialCursors
StartTutorialCursors: @ 0x0807A6E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _0807A734 @ =0x03004690
	ldr r0, [r6]
	bl sub_080314AC
	ldr r4, _0807A738 @ =0x0203E66C
	bl CountTargets
	strb r0, [r4]
	cmp r5, #0
	bne _0807A740
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807A75A
	ldr r0, _0807A73C @ =0x08CA7534
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x54]
	movs r0, #0
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	movs r0, #0
	bl EnsureCameraOntoPosition
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
	b _0807A75A
	.align 2, 0
_0807A734: .4byte 0x03004690
_0807A738: .4byte 0x0203E66C
_0807A73C: .4byte 0x08CA7534
_0807A740:
	ldr r0, _0807A760 @ =0x08CA7534
	movs r1, #3
	bl Proc_Start
	str r5, [r0, #0x54]
	ldr r1, [r6]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetMapCursorPosition
_0807A75A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A760: .4byte 0x08CA7534
