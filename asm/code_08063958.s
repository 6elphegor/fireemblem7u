	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxMantBatabata_Loop1
EfxMantBatabata_Loop1: @ 0x08063958
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x60]
	ldr r0, [r2, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	ldr r0, [r2, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0806397E
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806397E
	adds r0, r2, #0
	bl Proc_Break
_0806397E:
	pop {r0}
	bx r0
	.align 2, 0
