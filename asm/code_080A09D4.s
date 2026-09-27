	.include "macro.inc"

	.syntax unified

	thumb_func_start LoadSavedBonusClaimFlags
LoadSavedBonusClaimFlags: @ 0x080A09D4
	push {lr}
	sub sp, #4
	bl GetSaveReadAddr
	ldr r1, _080A09F4 @ =0x03005E70
	ldr r2, _080A09F8 @ =0x00000D88
	adds r0, r0, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #4
	bl _call_via_r3
	ldr r0, [sp]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080A09F4: .4byte 0x03005E70
_080A09F8: .4byte 0x00000D88
