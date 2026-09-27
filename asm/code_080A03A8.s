	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGlobalCompletionCount
GetGlobalCompletionCount: @ 0x080A03A8
	push {lr}
	sub sp, #0x64
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A03C0
	mov r0, sp
	bl GetGlobalCompletionCntByInfo
	b _080A03C2
_080A03C0:
	movs r0, #0
_080A03C2:
	add sp, #0x64
	pop {r1}
	bx r1
