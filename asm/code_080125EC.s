	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_CheckSramResetKeyCombo
GC_CheckSramResetKeyCombo: @ 0x080125EC
	push {lr}
	adds r2, r0, #0
	ldr r0, _0801260C @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	ldrh r1, [r1, #4]
	cmp r1, r0
	bne _08012606
	adds r0, r2, #0
	movs r1, #0xf
	bl Proc_Goto
_08012606:
	pop {r0}
	bx r0
	.align 2, 0
_0801260C: .4byte 0x08B857F8
