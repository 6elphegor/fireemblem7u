	.include "macro.inc"

	.syntax unified

	thumb_func_start Talk_OnInit
Talk_OnInit: @ 0x080081E4
	push {lr}
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _08008208
	bl ApplySystemObjectsGraphics
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08008208:
	ldr r0, _08008214 @ =0x08B909BC
	movs r1, #3
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_08008214: .4byte 0x08B909BC
