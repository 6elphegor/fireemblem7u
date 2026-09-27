	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093250
sub_08093250: @ 0x08093250
	push {r4, lr}
	sub sp, #8
	adds r4, r1, #0
	bl NewSysBlackBoxHandler
	adds r0, r4, #0
	bl SysBlackBoxSetGfx
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093284
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
	b _0809329C
_08093284:
	movs r2, #0x91
	lsls r2, r2, #3
	movs r0, #3
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r3, #0xc
	bl EnableSysBlackBox
_0809329C:
	movs r2, #0x90
	lsls r2, r2, #3
	movs r0, #4
	str r0, [sp]
	movs r0, #0xc0
	lsls r0, r0, #4
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0x6c
	movs r3, #0x10
	bl EnableSysBlackBox
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
