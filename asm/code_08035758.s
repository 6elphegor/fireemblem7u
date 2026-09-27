	.include "macro.inc"

	.syntax unified

	thumb_func_start CpPerform_Cleanup
CpPerform_Cleanup: @ 0x08035758
	push {r4, lr}
	adds r4, r0, #0
	bl AiUpdateUnitsSeekHealing
	bl AiEndMuAndRefreshUnits
	ldr r0, _08035788 @ =0x03004690
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	beq _08035778
	ldr r0, [r1, #0xc]
	ldr r1, _0803578C @ =0x00010005
	ands r0, r1
	cmp r0, #0
	beq _08035780
_08035778:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08035780:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035788: .4byte 0x03004690
_0803578C: .4byte 0x00010005
