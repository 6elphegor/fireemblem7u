	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxFlashUnitRestorePal
EfxFlashUnitRestorePal: @ 0x0804F640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F66C
	ldr r0, _0804F664 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _0804F668 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl BanimSetFrontPaletteForDragon
	b _0804F67E
	.align 2, 0
_0804F664: .4byte 0x02000054
_0804F668: .4byte 0x02022B40
_0804F66C:
	ldr r0, _0804F690 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _0804F694 @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl BanimSetFrontPaletteForDragon
_0804F67E:
	bl EnablePalSync
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F690: .4byte 0x02000054
_0804F694: .4byte 0x02022B80
