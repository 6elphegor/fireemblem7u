	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FA08
sub_0804FA08: @ 0x0804FA08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804FA2C
	ldr r0, _0804FA24 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _0804FA28 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	b _0804FA38
	.align 2, 0
_0804FA24: .4byte 0x02000054
_0804FA28: .4byte 0x02022B40
_0804FA2C:
	ldr r0, _0804FA48 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _0804FA4C @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
_0804FA38:
	ldr r0, [r4, #0x5c]
	bl BanimSetFrontPaletteForDragon
	bl EnablePalSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FA48: .4byte 0x02000054
_0804FA4C: .4byte 0x02022B80
