	.include "macro.inc"

	.syntax unified

	thumb_func_start SioTeamList_LoadTeam_Dummy
SioTeamList_LoadTeam_Dummy: @ 0x0803F0C4
	push {r4, lr}
	sub sp, #0x14
	ldr r4, [r0, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl sub_080A1E8C
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
