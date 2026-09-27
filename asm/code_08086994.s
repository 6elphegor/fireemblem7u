	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateUnitSpritePal
UpdateUnitSpritePal: @ 0x08086994
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080869BC
	movs r0, #0
	str r0, [sp]
	ldr r1, _080869B4 @ =0x02022C00
	ldr r2, _080869B8 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	bl EnablePalSync
	b _080869C0
	.align 2, 0
_080869B4: .4byte 0x02022C00
_080869B8: .4byte 0x01000008
_080869BC:
	bl ApplyUnitSpritePalettes
_080869C0:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
