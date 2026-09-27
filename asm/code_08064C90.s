	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonUpdateFlashingUnit
EkrDragonUpdateFlashingUnit: @ 0x08064C90
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08064CCA
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08064CBC
	ldr r0, _08064CB4 @ =0x081D97D0
	ldr r1, _08064CB8 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	b _08064CC6
	.align 2, 0
_08064CB4: .4byte 0x081D97D0
_08064CB8: .4byte 0x02022920
_08064CBC:
	ldr r0, _08064CD0 @ =0x081D97D0
	ldr r1, _08064CD4 @ =0x02022940
	movs r2, #8
	bl CpuFastSet
_08064CC6:
	bl EnablePalSync
_08064CCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064CD0: .4byte 0x081D97D0
_08064CD4: .4byte 0x02022940
