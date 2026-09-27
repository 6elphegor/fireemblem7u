	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPlayerPhaseSideWindows
EndPlayerPhaseSideWindows: @ 0x08085C7C
	push {lr}
	ldr r0, _08085CC4 @ =0x08CC2C60
	bl Proc_EndEach
	ldr r0, _08085CC8 @ =0x08CC2CE8
	bl Proc_EndEach
	ldr r0, _08085CCC @ =0x08CC2C00
	bl Proc_EndEach
	ldr r0, _08085CD0 @ =0x08CC2D38
	bl Proc_EndEach
	ldr r0, _08085CD4 @ =0x08CC2D98
	bl Proc_EndEach
	ldr r3, _08085CD8 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl ClearUi
	pop {r0}
	bx r0
	.align 2, 0
_08085CC4: .4byte 0x08CC2C60
_08085CC8: .4byte 0x08CC2CE8
_08085CCC: .4byte 0x08CC2C00
_08085CD0: .4byte 0x08CC2D38
_08085CD4: .4byte 0x08CC2D98
_08085CD8: .4byte 0x03002870
