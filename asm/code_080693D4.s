	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_SetBgs
EkrLvup_SetBgs: @ 0x080693D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069400 @ =EkrLvupHBlank
	bl SetOnHBlankA
	movs r0, #1
	bl EnableBgSync
	movs r0, #4
	bl EnableBgSync
	movs r0, #2
	bl EnableBgSync
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069400: .4byte EkrLvupHBlank
