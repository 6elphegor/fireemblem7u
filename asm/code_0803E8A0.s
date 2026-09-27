	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E8A0
sub_0803E8A0: @ 0x0803E8A0
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl Proc_End
	bl sub_08047CA8
	bl InitUnits
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	ldr r3, _0803E8E0 @ =0x0203DA78
	ldr r2, [r4, #0x40]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x13]
	mov r2, sp
	bl ReadMultiArenaSaveTeam
	adds r0, r4, #0
	bl StartUnitListScreenUnk
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E8E0: .4byte 0x0203DA78
