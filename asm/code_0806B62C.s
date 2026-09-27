	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrPopup_DrawWpnBroke
ekrPopup_DrawWpnBroke: @ 0x0806B62C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0806B648
	movs r1, #1
	bl DrawBattlePopup
	bl EfxPlaySound5CVol100
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0806B648:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
