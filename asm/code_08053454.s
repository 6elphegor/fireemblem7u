	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleAIS_ExecCommands
BattleAIS_ExecCommands: @ 0x08053454
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	movs r2, #0
