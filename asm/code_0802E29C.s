	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshBMapDisplay_FromBattle
RefreshBMapDisplay_FromBattle: @ 0x0802E29C
	push {lr}
	ldr r0, _0802E304 @ =OnMain
	bl SetMainFunc
	ldr r0, _0802E308 @ =OnVBlank
	bl SetOnVBlank
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	bl ClearUi
	ldr r3, _0802E30C @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
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
	movs r0, #0
	bl SetBlankChr
	ldr r0, _0802E310 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0802E304: .4byte OnMain
_0802E308: .4byte OnVBlank
_0802E30C: .4byte 0x03002870
_0802E310: .4byte 0x02023C60
