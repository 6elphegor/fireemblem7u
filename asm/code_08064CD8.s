	.include "macro.inc"

	.syntax unified

	thumb_func_start BanimSetFrontPaletteForDragon
BanimSetFrontPaletteForDragon: @ 0x08064CD8
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064D12
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064D04
	ldr r0, _08064CFC @ =0x082E0FEC
	ldr r1, _08064D00 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	b _08064D0E
	.align 2, 0
_08064CFC: .4byte 0x082E0FEC
_08064D00: .4byte 0x02022920
_08064D04:
	ldr r0, _08064D18 @ =0x082E0FEC
	ldr r1, _08064D1C @ =0x02022940
	movs r2, #8
	bl CpuFastSet
_08064D0E:
	bl EnablePalSync
_08064D12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064D18: .4byte 0x082E0FEC
_08064D1C: .4byte 0x02022940
