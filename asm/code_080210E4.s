	.include "macro.inc"

	.syntax unified

	thumb_func_start StartEmitStarsAnim
StartEmitStarsAnim: @ 0x080210E4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r4, r3, #0
	ldr r5, [sp, #0x18]
	ldr r0, _0802113C @ =0x08B93CEC
	ldr r1, _08021140 @ =0x06014000
	movs r2, #0x20
	bl RegisterDataMove
	ldr r0, _08021144 @ =0x08B93CD4
	adds r1, r6, #0
	bl Proc_Start
	adds r3, r0, #0
	mov r0, r8
	str r0, [r3, #0x34]
	mov r0, sb
	str r0, [r3, #0x38]
	lsls r4, r4, #0x10
	str r4, [r3, #0x3c]
	lsls r5, r5, #0x10
	str r5, [r3, #0x40]
	adds r0, r3, #0
	adds r0, #0x4c
	movs r2, #0
	strh r2, [r0]
	adds r1, r3, #0
	adds r1, #0x64
	ldr r0, _08021148 @ =0x0000FFFF
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x66
	strh r2, [r0]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802113C: .4byte 0x08B93CEC
_08021140: .4byte 0x06014000
_08021144: .4byte 0x08B93CD4
_08021148: .4byte 0x0000FFFF
